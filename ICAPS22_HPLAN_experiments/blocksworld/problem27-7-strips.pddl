( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b932 - block
    b123 - block
    b649 - block
    b87 - block
    b289 - block
    b830 - block
    b695 - block
    b387 - block
    b467 - block
    b284 - block
    b753 - block
    b186 - block
    b551 - block
    b567 - block
    b546 - block
    b228 - block
    b990 - block
    b15 - block
    b898 - block
    b25 - block
    b34 - block
    b86 - block
    b127 - block
    b837 - block
    b44 - block
    b189 - block
    b292 - block
    b803 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b932 )
    ( on b123 b932 )
    ( on b649 b123 )
    ( on b87 b649 )
    ( on b289 b87 )
    ( on b830 b289 )
    ( on b695 b830 )
    ( on b387 b695 )
    ( on b467 b387 )
    ( on b284 b467 )
    ( on b753 b284 )
    ( on b186 b753 )
    ( on b551 b186 )
    ( on b567 b551 )
    ( on b546 b567 )
    ( on b228 b546 )
    ( on b990 b228 )
    ( on b15 b990 )
    ( on b898 b15 )
    ( on b25 b898 )
    ( on b34 b25 )
    ( on b86 b34 )
    ( on b127 b86 )
    ( on b837 b127 )
    ( on b44 b837 )
    ( on b189 b44 )
    ( on b292 b189 )
    ( on b803 b292 )
    ( clear b803 )
  )
  ( :goal
    ( and
      ( clear b932 )
    )
  )
)
