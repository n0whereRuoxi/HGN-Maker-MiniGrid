( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b85 - block
    b815 - block
    b822 - block
    b811 - block
    b687 - block
    b974 - block
    b139 - block
    b369 - block
    b433 - block
    b867 - block
    b728 - block
    b927 - block
    b681 - block
    b861 - block
    b406 - block
    b505 - block
    b962 - block
    b527 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b85 )
    ( on b815 b85 )
    ( on b822 b815 )
    ( on b811 b822 )
    ( on b687 b811 )
    ( on b974 b687 )
    ( on b139 b974 )
    ( on b369 b139 )
    ( on b433 b369 )
    ( on b867 b433 )
    ( on b728 b867 )
    ( on b927 b728 )
    ( on b681 b927 )
    ( on b861 b681 )
    ( on b406 b861 )
    ( on b505 b406 )
    ( on b962 b505 )
    ( on b527 b962 )
    ( clear b527 )
  )
  ( :goal
    ( and
      ( clear b85 )
    )
  )
)
