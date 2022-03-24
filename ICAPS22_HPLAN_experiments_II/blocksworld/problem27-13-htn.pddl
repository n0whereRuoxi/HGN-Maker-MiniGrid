( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b813 - block
    b826 - block
    b155 - block
    b94 - block
    b838 - block
    b561 - block
    b227 - block
    b606 - block
    b598 - block
    b447 - block
    b467 - block
    b343 - block
    b257 - block
    b947 - block
    b587 - block
    b204 - block
    b481 - block
    b592 - block
    b150 - block
    b651 - block
    b762 - block
    b560 - block
    b275 - block
    b434 - block
    b799 - block
    b1 - block
    b298 - block
    b552 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b813 )
    ( on b826 b813 )
    ( on b155 b826 )
    ( on b94 b155 )
    ( on b838 b94 )
    ( on b561 b838 )
    ( on b227 b561 )
    ( on b606 b227 )
    ( on b598 b606 )
    ( on b447 b598 )
    ( on b467 b447 )
    ( on b343 b467 )
    ( on b257 b343 )
    ( on b947 b257 )
    ( on b587 b947 )
    ( on b204 b587 )
    ( on b481 b204 )
    ( on b592 b481 )
    ( on b150 b592 )
    ( on b651 b150 )
    ( on b762 b651 )
    ( on b560 b762 )
    ( on b275 b560 )
    ( on b434 b275 )
    ( on b799 b434 )
    ( on b1 b799 )
    ( on b298 b1 )
    ( on b552 b298 )
    ( clear b552 )
  )
  ( :tasks
    ( Make-27Pile b826 b155 b94 b838 b561 b227 b606 b598 b447 b467 b343 b257 b947 b587 b204 b481 b592 b150 b651 b762 b560 b275 b434 b799 b1 b298 b552 )
  )
)
