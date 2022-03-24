( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b810 - block
    b267 - block
    b832 - block
    b565 - block
    b562 - block
    b572 - block
    b813 - block
    b183 - block
    b829 - block
    b569 - block
    b392 - block
    b411 - block
    b588 - block
    b292 - block
    b343 - block
    b798 - block
    b554 - block
    b154 - block
    b605 - block
    b288 - block
    b71 - block
    b27 - block
    b606 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b810 )
    ( on b267 b810 )
    ( on b832 b267 )
    ( on b565 b832 )
    ( on b562 b565 )
    ( on b572 b562 )
    ( on b813 b572 )
    ( on b183 b813 )
    ( on b829 b183 )
    ( on b569 b829 )
    ( on b392 b569 )
    ( on b411 b392 )
    ( on b588 b411 )
    ( on b292 b588 )
    ( on b343 b292 )
    ( on b798 b343 )
    ( on b554 b798 )
    ( on b154 b554 )
    ( on b605 b154 )
    ( on b288 b605 )
    ( on b71 b288 )
    ( on b27 b71 )
    ( on b606 b27 )
    ( clear b606 )
  )
  ( :tasks
    ( Make-22Pile b267 b832 b565 b562 b572 b813 b183 b829 b569 b392 b411 b588 b292 b343 b798 b554 b154 b605 b288 b71 b27 b606 )
  )
)
