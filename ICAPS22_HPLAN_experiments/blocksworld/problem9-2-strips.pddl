( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b781 - block
    b87 - block
    b975 - block
    b110 - block
    b693 - block
    b207 - block
    b735 - block
    b364 - block
    b474 - block
    b313 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b781 )
    ( on b87 b781 )
    ( on b975 b87 )
    ( on b110 b975 )
    ( on b693 b110 )
    ( on b207 b693 )
    ( on b735 b207 )
    ( on b364 b735 )
    ( on b474 b364 )
    ( on b313 b474 )
    ( clear b313 )
  )
  ( :goal
    ( and
      ( clear b781 )
    )
  )
)
