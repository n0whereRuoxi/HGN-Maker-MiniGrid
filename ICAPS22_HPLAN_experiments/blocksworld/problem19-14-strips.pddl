( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b725 - block
    b757 - block
    b946 - block
    b234 - block
    b677 - block
    b660 - block
    b446 - block
    b48 - block
    b245 - block
    b369 - block
    b955 - block
    b212 - block
    b794 - block
    b230 - block
    b288 - block
    b191 - block
    b942 - block
    b540 - block
    b800 - block
    b921 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b725 )
    ( on b757 b725 )
    ( on b946 b757 )
    ( on b234 b946 )
    ( on b677 b234 )
    ( on b660 b677 )
    ( on b446 b660 )
    ( on b48 b446 )
    ( on b245 b48 )
    ( on b369 b245 )
    ( on b955 b369 )
    ( on b212 b955 )
    ( on b794 b212 )
    ( on b230 b794 )
    ( on b288 b230 )
    ( on b191 b288 )
    ( on b942 b191 )
    ( on b540 b942 )
    ( on b800 b540 )
    ( on b921 b800 )
    ( clear b921 )
  )
  ( :goal
    ( and
      ( clear b725 )
    )
  )
)
