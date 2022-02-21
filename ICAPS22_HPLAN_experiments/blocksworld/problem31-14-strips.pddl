( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b802 - block
    b316 - block
    b655 - block
    b351 - block
    b177 - block
    b774 - block
    b811 - block
    b170 - block
    b614 - block
    b563 - block
    b996 - block
    b469 - block
    b26 - block
    b421 - block
    b110 - block
    b813 - block
    b785 - block
    b483 - block
    b167 - block
    b943 - block
    b128 - block
    b166 - block
    b949 - block
    b987 - block
    b298 - block
    b487 - block
    b208 - block
    b746 - block
    b573 - block
    b252 - block
    b823 - block
    b459 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b802 )
    ( on b316 b802 )
    ( on b655 b316 )
    ( on b351 b655 )
    ( on b177 b351 )
    ( on b774 b177 )
    ( on b811 b774 )
    ( on b170 b811 )
    ( on b614 b170 )
    ( on b563 b614 )
    ( on b996 b563 )
    ( on b469 b996 )
    ( on b26 b469 )
    ( on b421 b26 )
    ( on b110 b421 )
    ( on b813 b110 )
    ( on b785 b813 )
    ( on b483 b785 )
    ( on b167 b483 )
    ( on b943 b167 )
    ( on b128 b943 )
    ( on b166 b128 )
    ( on b949 b166 )
    ( on b987 b949 )
    ( on b298 b987 )
    ( on b487 b298 )
    ( on b208 b487 )
    ( on b746 b208 )
    ( on b573 b746 )
    ( on b252 b573 )
    ( on b823 b252 )
    ( on b459 b823 )
    ( clear b459 )
  )
  ( :goal
    ( and
      ( clear b802 )
    )
  )
)
