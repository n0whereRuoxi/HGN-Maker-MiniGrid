( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b708 - block
    b636 - block
    b292 - block
    b564 - block
    b917 - block
    b955 - block
    b396 - block
    b532 - block
    b852 - block
    b260 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b708 )
    ( on b636 b708 )
    ( on b292 b636 )
    ( on b564 b292 )
    ( on b917 b564 )
    ( on b955 b917 )
    ( on b396 b955 )
    ( on b532 b396 )
    ( on b852 b532 )
    ( on b260 b852 )
    ( clear b260 )
  )
  ( :goal
    ( and
      ( clear b708 )
    )
  )
)
