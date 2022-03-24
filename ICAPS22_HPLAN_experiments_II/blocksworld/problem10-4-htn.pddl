( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b953 - block
    b407 - block
    b249 - block
    b857 - block
    b205 - block
    b907 - block
    b904 - block
    b356 - block
    b262 - block
    b917 - block
    b334 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b953 )
    ( on b407 b953 )
    ( on b249 b407 )
    ( on b857 b249 )
    ( on b205 b857 )
    ( on b907 b205 )
    ( on b904 b907 )
    ( on b356 b904 )
    ( on b262 b356 )
    ( on b917 b262 )
    ( on b334 b917 )
    ( clear b334 )
  )
  ( :tasks
    ( Make-10Pile b407 b249 b857 b205 b907 b904 b356 b262 b917 b334 )
  )
)
