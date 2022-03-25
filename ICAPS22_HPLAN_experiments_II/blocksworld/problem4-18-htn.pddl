( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b160 - block
    b467 - block
    b845 - block
    b973 - block
    b421 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b160 )
    ( on b467 b160 )
    ( on b845 b467 )
    ( on b973 b845 )
    ( on b421 b973 )
    ( clear b421 )
  )
  ( :tasks
    ( Make-4Pile b467 b845 b973 b421 )
  )
)