( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b913 - block
    b477 - block
    b887 - block
    b709 - block
    b816 - block
    b137 - block
    b256 - block
    b874 - block
    b175 - block
    b402 - block
    b975 - block
    b736 - block
    b235 - block
    b76 - block
    b527 - block
    b831 - block
    b228 - block
    b69 - block
    b871 - block
    b687 - block
    b439 - block
    b615 - block
    b903 - block
    b601 - block
    b896 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b913 )
    ( on b477 b913 )
    ( on b887 b477 )
    ( on b709 b887 )
    ( on b816 b709 )
    ( on b137 b816 )
    ( on b256 b137 )
    ( on b874 b256 )
    ( on b175 b874 )
    ( on b402 b175 )
    ( on b975 b402 )
    ( on b736 b975 )
    ( on b235 b736 )
    ( on b76 b235 )
    ( on b527 b76 )
    ( on b831 b527 )
    ( on b228 b831 )
    ( on b69 b228 )
    ( on b871 b69 )
    ( on b687 b871 )
    ( on b439 b687 )
    ( on b615 b439 )
    ( on b903 b615 )
    ( on b601 b903 )
    ( on b896 b601 )
    ( clear b896 )
  )
  ( :goal
    ( and
      ( clear b913 )
    )
  )
)
