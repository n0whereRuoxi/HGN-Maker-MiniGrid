( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b331 - block
    b372 - block
    b883 - block
    b583 - block
    b138 - block
    b192 - block
    b793 - block
    b872 - block
    b989 - block
    b349 - block
    b889 - block
    b171 - block
    b351 - block
    b229 - block
    b104 - block
    b80 - block
    b53 - block
    b570 - block
    b870 - block
    b677 - block
    b170 - block
    b978 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b331 )
    ( on b372 b331 )
    ( on b883 b372 )
    ( on b583 b883 )
    ( on b138 b583 )
    ( on b192 b138 )
    ( on b793 b192 )
    ( on b872 b793 )
    ( on b989 b872 )
    ( on b349 b989 )
    ( on b889 b349 )
    ( on b171 b889 )
    ( on b351 b171 )
    ( on b229 b351 )
    ( on b104 b229 )
    ( on b80 b104 )
    ( on b53 b80 )
    ( on b570 b53 )
    ( on b870 b570 )
    ( on b677 b870 )
    ( on b170 b677 )
    ( on b978 b170 )
    ( clear b978 )
  )
  ( :tasks
    ( Make-21Pile b372 b883 b583 b138 b192 b793 b872 b989 b349 b889 b171 b351 b229 b104 b80 b53 b570 b870 b677 b170 b978 )
  )
)
