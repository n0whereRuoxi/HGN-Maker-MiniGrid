( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b129 - block
    b740 - block
    b857 - block
    b547 - block
    b575 - block
    b835 - block
    b690 - block
    b210 - block
    b401 - block
    b737 - block
    b923 - block
    b994 - block
    b375 - block
    b678 - block
    b682 - block
    b259 - block
    b881 - block
    b390 - block
    b95 - block
    b92 - block
    b337 - block
    b405 - block
    b991 - block
    b530 - block
    b565 - block
    b403 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b129 )
    ( on b740 b129 )
    ( on b857 b740 )
    ( on b547 b857 )
    ( on b575 b547 )
    ( on b835 b575 )
    ( on b690 b835 )
    ( on b210 b690 )
    ( on b401 b210 )
    ( on b737 b401 )
    ( on b923 b737 )
    ( on b994 b923 )
    ( on b375 b994 )
    ( on b678 b375 )
    ( on b682 b678 )
    ( on b259 b682 )
    ( on b881 b259 )
    ( on b390 b881 )
    ( on b95 b390 )
    ( on b92 b95 )
    ( on b337 b92 )
    ( on b405 b337 )
    ( on b991 b405 )
    ( on b530 b991 )
    ( on b565 b530 )
    ( on b403 b565 )
    ( clear b403 )
  )
  ( :goal
    ( and
      ( clear b129 )
    )
  )
)
