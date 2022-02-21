( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b962 - block
    b927 - block
    b901 - block
    b812 - block
    b94 - block
    b414 - block
    b156 - block
    b213 - block
    b774 - block
    b120 - block
    b741 - block
    b577 - block
    b531 - block
    b617 - block
    b866 - block
    b722 - block
    b12 - block
    b920 - block
    b546 - block
    b852 - block
    b685 - block
    b86 - block
    b115 - block
    b147 - block
    b380 - block
    b601 - block
    b7 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b962 )
    ( on b927 b962 )
    ( on b901 b927 )
    ( on b812 b901 )
    ( on b94 b812 )
    ( on b414 b94 )
    ( on b156 b414 )
    ( on b213 b156 )
    ( on b774 b213 )
    ( on b120 b774 )
    ( on b741 b120 )
    ( on b577 b741 )
    ( on b531 b577 )
    ( on b617 b531 )
    ( on b866 b617 )
    ( on b722 b866 )
    ( on b12 b722 )
    ( on b920 b12 )
    ( on b546 b920 )
    ( on b852 b546 )
    ( on b685 b852 )
    ( on b86 b685 )
    ( on b115 b86 )
    ( on b147 b115 )
    ( on b380 b147 )
    ( on b601 b380 )
    ( on b7 b601 )
    ( clear b7 )
  )
  ( :goal
    ( and
      ( clear b962 )
    )
  )
)
