( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b944 - block
    b570 - block
    b39 - block
    b427 - block
    b885 - block
    b349 - block
    b956 - block
    b110 - block
    b994 - block
    b729 - block
    b816 - block
    b811 - block
    b970 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b944 )
    ( on b570 b944 )
    ( on b39 b570 )
    ( on b427 b39 )
    ( on b885 b427 )
    ( on b349 b885 )
    ( on b956 b349 )
    ( on b110 b956 )
    ( on b994 b110 )
    ( on b729 b994 )
    ( on b816 b729 )
    ( on b811 b816 )
    ( on b970 b811 )
    ( clear b970 )
  )
  ( :tasks
    ( Make-12Pile b570 b39 b427 b885 b349 b956 b110 b994 b729 b816 b811 b970 )
  )
)
