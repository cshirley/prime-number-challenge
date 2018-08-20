class MatrixRender
  DEFAULTS = {output:STDOUT, title:"", vertical_header:[], horizontal_header:[]}
  DELIMITER = "\t"
  def initialize(options ={})
    options = DEFAULTS.merge(options)
    @output_stream = options[:output]
    @title = options[:title]
    @v_header = options[:vertical_header]
    @h_header = options[:horizontal_header]
  end

  def render(matrix)
    render_title
    render_horizontal_header
    render_rows(matrix)
  end

  def render_title
    @output_stream.puts(@title) unless @title.empty?
  end

  def render_horizontal_header
    header_row = ([""] + @h_header).join(DELIMITER)
    @output_stream.puts header_row
    @output_stream.puts "-" * header_row.gsub(DELIMITER, " "*7).length
  end

  def render_rows(matrix)
     matrix.each_with_index do |row, i|
      render_row( !@v_header.empty? ? [@v_header[i]] + row : row )
    end
  end

  def render_row(row)
    @output_stream.puts row.join(DELIMITER)
  end
end
