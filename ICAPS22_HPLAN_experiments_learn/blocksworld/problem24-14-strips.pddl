( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b307 - block
    b542 - block
    b811 - block
    b517 - block
    b445 - block
    b831 - block
    b928 - block
    b309 - block
    b803 - block
    b463 - block
    b347 - block
    b768 - block
    b797 - block
    b579 - block
    b506 - block
    b622 - block
    b338 - block
    b820 - block
    b41 - block
    b915 - block
    b495 - block
    b657 - block
    b891 - block
    b471 - block
    b674 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b307 )
    ( on b542 b307 )
    ( on b811 b542 )
    ( on b517 b811 )
    ( on b445 b517 )
    ( on b831 b445 )
    ( on b928 b831 )
    ( on b309 b928 )
    ( on b803 b309 )
    ( on b463 b803 )
    ( on b347 b463 )
    ( on b768 b347 )
    ( on b797 b768 )
    ( on b579 b797 )
    ( on b506 b579 )
    ( on b622 b506 )
    ( on b338 b622 )
    ( on b820 b338 )
    ( on b41 b820 )
    ( on b915 b41 )
    ( on b495 b915 )
    ( on b657 b495 )
    ( on b891 b657 )
    ( on b471 b891 )
    ( on b674 b471 )
    ( clear b674 )
  )
  ( :goal
    ( and
      ( clear b307 )
    )
  )
)
