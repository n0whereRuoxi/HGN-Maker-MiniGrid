( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b798 - block
    b624 - block
    b336 - block
    b235 - block
    b601 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b798 )
    ( on b624 b798 )
    ( on b336 b624 )
    ( on b235 b336 )
    ( on b601 b235 )
    ( clear b601 )
  )
  ( :goal
    ( and
      ( clear b798 )
    )
  )
)
