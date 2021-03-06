class LocalDbCal < ScoreCal

  def self.calc_score(params)

   @response = params[:response].last
   score = LocalDbScore.find_by(Type: 'ReviewLocalDBScore', Round: params[:round], Reference_id: @response.id)
   unless score
     score= OnTheFlyCal.calc_score(:response => params[:response], :questions => params[:questions], :q_types => params[:q_types ], :round => params[:round])
     LocalDbScore.create(Type: 'ReviewLocalDBScore', Round: params[:round],Score: score, Reference_id: @response.id)
    return score
   end
    return score.Score
  end

end