defmodule FileSniffer do
  def type_from_extension(extension) do
   case extension do
    "exe" -> "application/octet-stream"
    "bmp" -> "image/bmp"
    "png" -> "image/png"
    "jpg" -> "image/jpg"
    "gif" -> "image/gif"
    _     -> nil
   end
  end

  def type_from_binary(<<file_identifier::binary-size(8), _rest::binary>>) do
    case file_identifier do
      <<0x7F, 0x45, 0x4C, 0x46, _rest::binary>> -> "application/octet-stream"
      <<0x42, 0x4D, _rest::binary>> -> "image/bmp"
      <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>> -> "image/png"
      <<0xFF, 0xD8, 0xFF, _rest::binary>> -> "image/jpg"
      <<0x47, 0x49, 0x46, _rest::binary>> -> "image/gif"
      _ -> nil
    end
  end
  def type_from_binary(_not_file), do: nil

  def verify(file_binary, extension) do
    is_same_type = type_from_extension(extension) == type_from_binary(file_binary)
    type_from_binary = type_from_binary(file_binary)

    case {is_same_type, type_from_binary} do
      {_, nil} -> {:error, "Warning, file format and file extension do not match."}
      {false, _} -> {:error, "Warning, file format and file extension do not match."}
      {true, type} ->{:ok, type}
    end
  end
end
