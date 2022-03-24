( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b552 - block
    b433 - block
    b708 - block
    b53 - block
    b701 - block
    b579 - block
    b916 - block
    b901 - block
    b704 - block
    b888 - block
    b467 - block
    b412 - block
    b413 - block
    b521 - block
    b767 - block
    b33 - block
    b850 - block
    b978 - block
    b69 - block
    b980 - block
    b224 - block
    b324 - block
    b545 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b552 )
    ( on b433 b552 )
    ( on b708 b433 )
    ( on b53 b708 )
    ( on b701 b53 )
    ( on b579 b701 )
    ( on b916 b579 )
    ( on b901 b916 )
    ( on b704 b901 )
    ( on b888 b704 )
    ( on b467 b888 )
    ( on b412 b467 )
    ( on b413 b412 )
    ( on b521 b413 )
    ( on b767 b521 )
    ( on b33 b767 )
    ( on b850 b33 )
    ( on b978 b850 )
    ( on b69 b978 )
    ( on b980 b69 )
    ( on b224 b980 )
    ( on b324 b224 )
    ( on b545 b324 )
    ( clear b545 )
  )
  ( :tasks
    ( Make-22Pile b433 b708 b53 b701 b579 b916 b901 b704 b888 b467 b412 b413 b521 b767 b33 b850 b978 b69 b980 b224 b324 b545 )
  )
)
