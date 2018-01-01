# frozen_string_literal: true

class AboutController < ApplicationController
  helper_attr_accessor :projects, :speaking_engagements, :sites

  def show
    self.projects = Project.featured.order(:featured_order)
    self.speaking_engagements = SpeakingEngagementDecorator
                                .decorate_collection(SpeakingEngagement.by_date.take(10))
    self.sites = site_data
  end

  private

  def site_data
    [
      [
        'Exercism',
        'http://exercism.io/jwworth',
        'writing algorithms and experimenting with different languages'
      ],
      [
        'Goodreads',
        'https://www.goodreads.com/jwworth',
        'recording what I read'
      ],
      [
        'Hashrocket Blog',
        'https://hashrocket.com/blog/rocketeers/jake-worth',
        'writing for my company'
      ],
      [
        'Meetup',
        'https://www.meetup.com/members/12542589/',
        'talking about code on the scene'
      ],
      [
        'PG Casts',
        'https://www.pgcasts.com',
        'screencasting about PostgreSQL'
      ],
      [
        'Today I Learned',
        'https://til.hashrocket.com/authors/jakeworth',
        'writing short articles about things I have learned'
      ],
      [
        'Quora',
        'https://www.quora.com/profile/Jake-Worth',
        'answering and asking programming questions'
      ],
      [
        'Stack Overflow',
        'https://stackoverflow.com/users/2112512/jake-worth',
        'answering and asking programming questions'
      ]
    ]
  end
end
