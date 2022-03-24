( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b890 - block
    b642 - block
    b425 - block
    b560 - block
    b198 - block
    b702 - block
    b796 - block
    b398 - block
    b515 - block
    b460 - block
    b80 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b890 )
    ( on b642 b890 )
    ( on b425 b642 )
    ( on b560 b425 )
    ( on b198 b560 )
    ( on b702 b198 )
    ( on b796 b702 )
    ( on b398 b796 )
    ( on b515 b398 )
    ( on b460 b515 )
    ( on b80 b460 )
    ( clear b80 )
  )
  ( :goal
    ( and
      ( clear b890 )
    )
  )
)
