class CommentBroadcastJob < ApplicationJob
	queue_as :default

	def peform(comment)
		ActionCable.server.broadcast "blog_#{comment.blog.id}_channel", comment: render_comment(comment)		
	end

	private
	def render_comment(comment)
		CommnentsController.render partial: 'comments/comment', local: {comment: comment}
	end
end