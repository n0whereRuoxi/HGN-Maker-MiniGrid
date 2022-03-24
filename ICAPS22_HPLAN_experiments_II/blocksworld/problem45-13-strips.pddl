( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b213 - block
    b936 - block
    b881 - block
    b33 - block
    b714 - block
    b518 - block
    b555 - block
    b825 - block
    b375 - block
    b354 - block
    b189 - block
    b855 - block
    b238 - block
    b915 - block
    b856 - block
    b634 - block
    b830 - block
    b219 - block
    b293 - block
    b126 - block
    b212 - block
    b724 - block
    b164 - block
    b563 - block
    b664 - block
    b320 - block
    b318 - block
    b52 - block
    b640 - block
    b919 - block
    b994 - block
    b772 - block
    b224 - block
    b670 - block
    b762 - block
    b988 - block
    b425 - block
    b356 - block
    b870 - block
    b899 - block
    b121 - block
    b228 - block
    b194 - block
    b158 - block
    b380 - block
    b978 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b213 )
    ( on b936 b213 )
    ( on b881 b936 )
    ( on b33 b881 )
    ( on b714 b33 )
    ( on b518 b714 )
    ( on b555 b518 )
    ( on b825 b555 )
    ( on b375 b825 )
    ( on b354 b375 )
    ( on b189 b354 )
    ( on b855 b189 )
    ( on b238 b855 )
    ( on b915 b238 )
    ( on b856 b915 )
    ( on b634 b856 )
    ( on b830 b634 )
    ( on b219 b830 )
    ( on b293 b219 )
    ( on b126 b293 )
    ( on b212 b126 )
    ( on b724 b212 )
    ( on b164 b724 )
    ( on b563 b164 )
    ( on b664 b563 )
    ( on b320 b664 )
    ( on b318 b320 )
    ( on b52 b318 )
    ( on b640 b52 )
    ( on b919 b640 )
    ( on b994 b919 )
    ( on b772 b994 )
    ( on b224 b772 )
    ( on b670 b224 )
    ( on b762 b670 )
    ( on b988 b762 )
    ( on b425 b988 )
    ( on b356 b425 )
    ( on b870 b356 )
    ( on b899 b870 )
    ( on b121 b899 )
    ( on b228 b121 )
    ( on b194 b228 )
    ( on b158 b194 )
    ( on b380 b158 )
    ( on b978 b380 )
    ( clear b978 )
  )
  ( :goal
    ( and
      ( clear b213 )
    )
  )
)
