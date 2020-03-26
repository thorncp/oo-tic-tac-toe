class PlayerWon
  attr_reader :status, :text_view

  def initialize(status:, text_view:)
    @status = status
    @text_view = text_view
  end

  def current?
    status.player_won?
  end

  def render
    text_view.render_player_won
  end
end
