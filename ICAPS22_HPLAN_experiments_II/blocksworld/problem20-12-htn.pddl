( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b989 - block
    b978 - block
    b762 - block
    b334 - block
    b324 - block
    b957 - block
    b192 - block
    b365 - block
    b595 - block
    b890 - block
    b782 - block
    b43 - block
    b788 - block
    b105 - block
    b2 - block
    b783 - block
    b584 - block
    b939 - block
    b711 - block
    b227 - block
    b951 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b989 )
    ( on b978 b989 )
    ( on b762 b978 )
    ( on b334 b762 )
    ( on b324 b334 )
    ( on b957 b324 )
    ( on b192 b957 )
    ( on b365 b192 )
    ( on b595 b365 )
    ( on b890 b595 )
    ( on b782 b890 )
    ( on b43 b782 )
    ( on b788 b43 )
    ( on b105 b788 )
    ( on b2 b105 )
    ( on b783 b2 )
    ( on b584 b783 )
    ( on b939 b584 )
    ( on b711 b939 )
    ( on b227 b711 )
    ( on b951 b227 )
    ( clear b951 )
  )
  ( :tasks
    ( Make-20Pile b978 b762 b334 b324 b957 b192 b365 b595 b890 b782 b43 b788 b105 b2 b783 b584 b939 b711 b227 b951 )
  )
)
