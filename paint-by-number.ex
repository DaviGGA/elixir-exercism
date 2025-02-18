defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    smallest_pow_n(0, color_count)
  end


  defp smallest_pow_n(n, goal) do
    cond do
      Integer.pow(2, n) >= goal -> n
      :else -> smallest_pow_n(n+1, goal)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count);
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count) do
    nil
  end

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count);
    <<first::size(bit_size), _rest::bitstring>> = picture;
    first
  end

  def drop_first_pixel(<<>>, _color_count) do
    <<>>
  end

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count);
    <<_first::size(bit_size), rest::bitstring>> = picture;
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
