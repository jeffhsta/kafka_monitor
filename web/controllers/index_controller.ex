defmodule KafkaMonitor.IndexController do
  use KafkaMonitor.Web, :controller
  require Logger

  @consumer_offsets "__consumer_offsets"

  def index(conn, _params) do
    data = KafkaEx.metadata
      |> Map.get(:topic_metadatas)
      |> Enum.filter(fn tdata -> tdata.topic != @consumer_offsets end)
      |> Enum.map(&extract_topic_partition/1)

    conn |> json(data)
  end

  defp extract_topic_partition(topic_metadata) do
    partitions = topic_metadata
      |> Map.get(:partition_metadatas)
      |> Enum.map(&extract_partition_data(&1, topic_metadata.topic))
      |> Enum.reduce(%{}, fn cur, acc ->
        value = Map.delete(cur, :partition_id)
        acc |> Map.put("#{cur.partition_id}" |> String.to_atom, value)
      end)

    %{topic: topic_metadata.topic, partitions: partitions}
  end

  defp extract_partition_data(partition_metadata, topic) do
    %{
      partition_id: partition_metadata.partition_id,
      replicas: partition_metadata.replicas,
      leader: partition_metadata.leader,
      messages: extract_messages(topic, partition_metadata.partition_id)
    }
  end

  defp extract_messages(topic, partition) do
    KafkaEx.fetch(topic, partition, offset: 0)
    |> Enum.map(fn msg ->
      msg.partitions
      |> List.first
      |> Map.get(:message_set)
      |> List.first
    end)
  end
end
