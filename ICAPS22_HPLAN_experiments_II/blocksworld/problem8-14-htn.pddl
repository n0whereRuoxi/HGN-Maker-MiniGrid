( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b904 - block
    b539 - block
    b656 - block
    b329 - block
    b842 - block
    b173 - block
    b116 - block
    b288 - block
    b287 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b904 )
    ( on b539 b904 )
    ( on b656 b539 )
    ( on b329 b656 )
    ( on b842 b329 )
    ( on b173 b842 )
    ( on b116 b173 )
    ( on b288 b116 )
    ( on b287 b288 )
    ( clear b287 )
  )
  ( :tasks
    ( Make-8Pile b539 b656 b329 b842 b173 b116 b288 b287 )
  )
)
