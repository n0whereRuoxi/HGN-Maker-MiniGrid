( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b552 - block
    b441 - block
    b231 - block
    b593 - block
    b190 - block
    b688 - block
    b806 - block
    b890 - block
    b786 - block
    b377 - block
    b812 - block
    b69 - block
    b379 - block
    b834 - block
    b582 - block
    b167 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b552 )
    ( on b441 b552 )
    ( on b231 b441 )
    ( on b593 b231 )
    ( on b190 b593 )
    ( on b688 b190 )
    ( on b806 b688 )
    ( on b890 b806 )
    ( on b786 b890 )
    ( on b377 b786 )
    ( on b812 b377 )
    ( on b69 b812 )
    ( on b379 b69 )
    ( on b834 b379 )
    ( on b582 b834 )
    ( on b167 b582 )
    ( clear b167 )
  )
  ( :goal
    ( and
      ( clear b552 )
    )
  )
)
