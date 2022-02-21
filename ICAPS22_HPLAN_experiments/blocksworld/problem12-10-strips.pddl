( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b697 - block
    b176 - block
    b72 - block
    b520 - block
    b961 - block
    b505 - block
    b287 - block
    b207 - block
    b911 - block
    b467 - block
    b750 - block
    b538 - block
    b340 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b697 )
    ( on b176 b697 )
    ( on b72 b176 )
    ( on b520 b72 )
    ( on b961 b520 )
    ( on b505 b961 )
    ( on b287 b505 )
    ( on b207 b287 )
    ( on b911 b207 )
    ( on b467 b911 )
    ( on b750 b467 )
    ( on b538 b750 )
    ( on b340 b538 )
    ( clear b340 )
  )
  ( :goal
    ( and
      ( clear b697 )
    )
  )
)
