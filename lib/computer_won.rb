class ComputerWon
  attr_reader :status, :text_view

  def initialize(status:, text_view:)
    @status = status
    @text_view = text_view
  end

  def current?
    status.computer_won?
  end

  def render
    text_view.render_computer_won
  end
end
