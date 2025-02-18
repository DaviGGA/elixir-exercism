defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      _ -> 0b0000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      0b0000 -> ?\s
    end
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode([], byte_list), do: byte_list

  defp do_encode([head | tail], byte_list) do
    nucleic_acid_code = encode_nucleotide(head)
    do_encode(tail, <<byte_list::bitstring, nucleic_acid_code::4>>)
  end

  def decode(dna) do
    do_decode(dna, [])
  end

  defp do_decode(<<>>, char_list), do: char_list

  defp do_decode(dna_bitstring, char_list) do
    <<first::4, rest::bitstring>> = dna_bitstring;
    code = decode_nucleotide(first);
    do_decode(rest, [code | char_list])
  end


end
