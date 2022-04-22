( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b83 - block
    b917 - block
    b643 - block
    b919 - block
    b560 - block
    b718 - block
    b981 - block
    b564 - block
    b156 - block
    b54 - block
    b711 - block
    b650 - block
    b308 - block
    b413 - block
    b417 - block
    b249 - block
    b298 - block
    b873 - block
    b238 - block
    b712 - block
    b946 - block
    b721 - block
    b91 - block
    b987 - block
    b786 - block
    b857 - block
    b464 - block
    b676 - block
    b861 - block
    b9 - block
    b116 - block
    b484 - block
    b830 - block
    b493 - block
    b602 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b83 )
    ( on b917 b83 )
    ( on b643 b917 )
    ( on b919 b643 )
    ( on b560 b919 )
    ( on b718 b560 )
    ( on b981 b718 )
    ( on b564 b981 )
    ( on b156 b564 )
    ( on b54 b156 )
    ( on b711 b54 )
    ( on b650 b711 )
    ( on b308 b650 )
    ( on b413 b308 )
    ( on b417 b413 )
    ( on b249 b417 )
    ( on b298 b249 )
    ( on b873 b298 )
    ( on b238 b873 )
    ( on b712 b238 )
    ( on b946 b712 )
    ( on b721 b946 )
    ( on b91 b721 )
    ( on b987 b91 )
    ( on b786 b987 )
    ( on b857 b786 )
    ( on b464 b857 )
    ( on b676 b464 )
    ( on b861 b676 )
    ( on b9 b861 )
    ( on b116 b9 )
    ( on b484 b116 )
    ( on b830 b484 )
    ( on b493 b830 )
    ( on b602 b493 )
    ( clear b602 )
  )
  ( :goal
    ( and
      ( clear b83 )
    )
  )
)
