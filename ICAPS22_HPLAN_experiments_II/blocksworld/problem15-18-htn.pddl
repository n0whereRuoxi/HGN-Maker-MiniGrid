( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b944 - block
    b238 - block
    b222 - block
    b762 - block
    b7 - block
    b767 - block
    b615 - block
    b301 - block
    b932 - block
    b9 - block
    b323 - block
    b331 - block
    b460 - block
    b159 - block
    b121 - block
    b668 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b944 )
    ( on b238 b944 )
    ( on b222 b238 )
    ( on b762 b222 )
    ( on b7 b762 )
    ( on b767 b7 )
    ( on b615 b767 )
    ( on b301 b615 )
    ( on b932 b301 )
    ( on b9 b932 )
    ( on b323 b9 )
    ( on b331 b323 )
    ( on b460 b331 )
    ( on b159 b460 )
    ( on b121 b159 )
    ( on b668 b121 )
    ( clear b668 )
  )
  ( :tasks
    ( Make-15Pile b238 b222 b762 b7 b767 b615 b301 b932 b9 b323 b331 b460 b159 b121 b668 )
  )
)
