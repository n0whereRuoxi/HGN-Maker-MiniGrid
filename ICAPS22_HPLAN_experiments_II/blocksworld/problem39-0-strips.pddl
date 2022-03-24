( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b408 - block
    b868 - block
    b114 - block
    b549 - block
    b409 - block
    b111 - block
    b446 - block
    b1 - block
    b315 - block
    b945 - block
    b680 - block
    b238 - block
    b347 - block
    b739 - block
    b476 - block
    b214 - block
    b321 - block
    b359 - block
    b384 - block
    b504 - block
    b796 - block
    b241 - block
    b267 - block
    b493 - block
    b53 - block
    b681 - block
    b642 - block
    b74 - block
    b845 - block
    b484 - block
    b286 - block
    b422 - block
    b942 - block
    b925 - block
    b377 - block
    b828 - block
    b331 - block
    b586 - block
    b325 - block
    b293 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b408 )
    ( on b868 b408 )
    ( on b114 b868 )
    ( on b549 b114 )
    ( on b409 b549 )
    ( on b111 b409 )
    ( on b446 b111 )
    ( on b1 b446 )
    ( on b315 b1 )
    ( on b945 b315 )
    ( on b680 b945 )
    ( on b238 b680 )
    ( on b347 b238 )
    ( on b739 b347 )
    ( on b476 b739 )
    ( on b214 b476 )
    ( on b321 b214 )
    ( on b359 b321 )
    ( on b384 b359 )
    ( on b504 b384 )
    ( on b796 b504 )
    ( on b241 b796 )
    ( on b267 b241 )
    ( on b493 b267 )
    ( on b53 b493 )
    ( on b681 b53 )
    ( on b642 b681 )
    ( on b74 b642 )
    ( on b845 b74 )
    ( on b484 b845 )
    ( on b286 b484 )
    ( on b422 b286 )
    ( on b942 b422 )
    ( on b925 b942 )
    ( on b377 b925 )
    ( on b828 b377 )
    ( on b331 b828 )
    ( on b586 b331 )
    ( on b325 b586 )
    ( on b293 b325 )
    ( clear b293 )
  )
  ( :goal
    ( and
      ( clear b408 )
    )
  )
)
