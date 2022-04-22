( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b24 - block
    b790 - block
    b899 - block
    b20 - block
    b893 - block
    b730 - block
    b475 - block
    b664 - block
    b923 - block
    b417 - block
    b6 - block
    b794 - block
    b202 - block
    b821 - block
    b660 - block
    b816 - block
    b708 - block
    b812 - block
    b580 - block
    b557 - block
    b850 - block
    b264 - block
    b22 - block
    b701 - block
    b931 - block
    b759 - block
    b838 - block
    b108 - block
    b432 - block
    b305 - block
    b272 - block
    b750 - block
    b711 - block
    b981 - block
    b378 - block
    b55 - block
    b938 - block
    b139 - block
    b841 - block
    b33 - block
    b193 - block
    b379 - block
    b969 - block
    b909 - block
    b109 - block
    b987 - block
    b329 - block
    b255 - block
    b857 - block
    b360 - block
    b322 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b24 )
    ( on b790 b24 )
    ( on b899 b790 )
    ( on b20 b899 )
    ( on b893 b20 )
    ( on b730 b893 )
    ( on b475 b730 )
    ( on b664 b475 )
    ( on b923 b664 )
    ( on b417 b923 )
    ( on b6 b417 )
    ( on b794 b6 )
    ( on b202 b794 )
    ( on b821 b202 )
    ( on b660 b821 )
    ( on b816 b660 )
    ( on b708 b816 )
    ( on b812 b708 )
    ( on b580 b812 )
    ( on b557 b580 )
    ( on b850 b557 )
    ( on b264 b850 )
    ( on b22 b264 )
    ( on b701 b22 )
    ( on b931 b701 )
    ( on b759 b931 )
    ( on b838 b759 )
    ( on b108 b838 )
    ( on b432 b108 )
    ( on b305 b432 )
    ( on b272 b305 )
    ( on b750 b272 )
    ( on b711 b750 )
    ( on b981 b711 )
    ( on b378 b981 )
    ( on b55 b378 )
    ( on b938 b55 )
    ( on b139 b938 )
    ( on b841 b139 )
    ( on b33 b841 )
    ( on b193 b33 )
    ( on b379 b193 )
    ( on b969 b379 )
    ( on b909 b969 )
    ( on b109 b909 )
    ( on b987 b109 )
    ( on b329 b987 )
    ( on b255 b329 )
    ( on b857 b255 )
    ( on b360 b857 )
    ( on b322 b360 )
    ( clear b322 )
  )
  ( :goal
    ( and
      ( clear b24 )
    )
  )
)
