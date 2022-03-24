( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b902 - block
    b170 - block
    b6 - block
    b685 - block
    b963 - block
    b721 - block
    b987 - block
    b678 - block
    b408 - block
    b850 - block
    b519 - block
    b316 - block
    b587 - block
    b561 - block
    b593 - block
    b353 - block
    b580 - block
    b811 - block
    b14 - block
    b557 - block
    b555 - block
    b58 - block
    b630 - block
    b896 - block
    b28 - block
    b986 - block
    b425 - block
    b900 - block
    b83 - block
    b960 - block
    b738 - block
    b601 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b902 )
    ( on b170 b902 )
    ( on b6 b170 )
    ( on b685 b6 )
    ( on b963 b685 )
    ( on b721 b963 )
    ( on b987 b721 )
    ( on b678 b987 )
    ( on b408 b678 )
    ( on b850 b408 )
    ( on b519 b850 )
    ( on b316 b519 )
    ( on b587 b316 )
    ( on b561 b587 )
    ( on b593 b561 )
    ( on b353 b593 )
    ( on b580 b353 )
    ( on b811 b580 )
    ( on b14 b811 )
    ( on b557 b14 )
    ( on b555 b557 )
    ( on b58 b555 )
    ( on b630 b58 )
    ( on b896 b630 )
    ( on b28 b896 )
    ( on b986 b28 )
    ( on b425 b986 )
    ( on b900 b425 )
    ( on b83 b900 )
    ( on b960 b83 )
    ( on b738 b960 )
    ( on b601 b738 )
    ( clear b601 )
  )
  ( :goal
    ( and
      ( clear b902 )
    )
  )
)
