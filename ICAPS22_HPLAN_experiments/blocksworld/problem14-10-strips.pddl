( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b734 - block
    b15 - block
    b494 - block
    b95 - block
    b735 - block
    b737 - block
    b718 - block
    b335 - block
    b137 - block
    b380 - block
    b4 - block
    b892 - block
    b773 - block
    b21 - block
    b713 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b734 )
    ( on b15 b734 )
    ( on b494 b15 )
    ( on b95 b494 )
    ( on b735 b95 )
    ( on b737 b735 )
    ( on b718 b737 )
    ( on b335 b718 )
    ( on b137 b335 )
    ( on b380 b137 )
    ( on b4 b380 )
    ( on b892 b4 )
    ( on b773 b892 )
    ( on b21 b773 )
    ( on b713 b21 )
    ( clear b713 )
  )
  ( :goal
    ( and
      ( clear b734 )
    )
  )
)
