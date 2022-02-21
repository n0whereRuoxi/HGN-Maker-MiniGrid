( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b981 - block
    b574 - block
    b172 - block
    b167 - block
    b61 - block
    b489 - block
    b45 - block
    b601 - block
    b84 - block
    b814 - block
    b189 - block
    b844 - block
    b216 - block
    b158 - block
    b24 - block
    b796 - block
    b641 - block
    b589 - block
    b553 - block
    b854 - block
    b47 - block
    b993 - block
    b825 - block
    b710 - block
    b411 - block
    b389 - block
    b486 - block
    b707 - block
    b363 - block
    b398 - block
    b443 - block
    b858 - block
    b420 - block
    b537 - block
    b42 - block
    b752 - block
    b464 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b981 )
    ( on b574 b981 )
    ( on b172 b574 )
    ( on b167 b172 )
    ( on b61 b167 )
    ( on b489 b61 )
    ( on b45 b489 )
    ( on b601 b45 )
    ( on b84 b601 )
    ( on b814 b84 )
    ( on b189 b814 )
    ( on b844 b189 )
    ( on b216 b844 )
    ( on b158 b216 )
    ( on b24 b158 )
    ( on b796 b24 )
    ( on b641 b796 )
    ( on b589 b641 )
    ( on b553 b589 )
    ( on b854 b553 )
    ( on b47 b854 )
    ( on b993 b47 )
    ( on b825 b993 )
    ( on b710 b825 )
    ( on b411 b710 )
    ( on b389 b411 )
    ( on b486 b389 )
    ( on b707 b486 )
    ( on b363 b707 )
    ( on b398 b363 )
    ( on b443 b398 )
    ( on b858 b443 )
    ( on b420 b858 )
    ( on b537 b420 )
    ( on b42 b537 )
    ( on b752 b42 )
    ( on b464 b752 )
    ( clear b464 )
  )
  ( :goal
    ( and
      ( clear b981 )
    )
  )
)
