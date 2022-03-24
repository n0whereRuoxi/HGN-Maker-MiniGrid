( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b6 - block
    b418 - block
    b497 - block
    b557 - block
    b63 - block
    b686 - block
    b794 - block
    b117 - block
    b420 - block
    b840 - block
    b383 - block
    b772 - block
    b490 - block
    b320 - block
    b903 - block
    b469 - block
    b815 - block
    b960 - block
    b10 - block
    b523 - block
    b564 - block
    b504 - block
    b324 - block
    b251 - block
    b993 - block
    b994 - block
    b181 - block
    b746 - block
    b12 - block
    b578 - block
    b570 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b6 )
    ( on b418 b6 )
    ( on b497 b418 )
    ( on b557 b497 )
    ( on b63 b557 )
    ( on b686 b63 )
    ( on b794 b686 )
    ( on b117 b794 )
    ( on b420 b117 )
    ( on b840 b420 )
    ( on b383 b840 )
    ( on b772 b383 )
    ( on b490 b772 )
    ( on b320 b490 )
    ( on b903 b320 )
    ( on b469 b903 )
    ( on b815 b469 )
    ( on b960 b815 )
    ( on b10 b960 )
    ( on b523 b10 )
    ( on b564 b523 )
    ( on b504 b564 )
    ( on b324 b504 )
    ( on b251 b324 )
    ( on b993 b251 )
    ( on b994 b993 )
    ( on b181 b994 )
    ( on b746 b181 )
    ( on b12 b746 )
    ( on b578 b12 )
    ( on b570 b578 )
    ( clear b570 )
  )
  ( :goal
    ( and
      ( clear b6 )
    )
  )
)
