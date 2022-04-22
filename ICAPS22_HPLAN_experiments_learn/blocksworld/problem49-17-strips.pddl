( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b71 - block
    b869 - block
    b590 - block
    b724 - block
    b39 - block
    b850 - block
    b144 - block
    b911 - block
    b40 - block
    b299 - block
    b45 - block
    b341 - block
    b650 - block
    b204 - block
    b915 - block
    b432 - block
    b534 - block
    b799 - block
    b48 - block
    b460 - block
    b235 - block
    b457 - block
    b212 - block
    b449 - block
    b30 - block
    b439 - block
    b972 - block
    b323 - block
    b207 - block
    b99 - block
    b370 - block
    b609 - block
    b5 - block
    b52 - block
    b559 - block
    b637 - block
    b550 - block
    b671 - block
    b501 - block
    b350 - block
    b856 - block
    b881 - block
    b605 - block
    b487 - block
    b92 - block
    b314 - block
    b596 - block
    b121 - block
    b931 - block
    b817 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b71 )
    ( on b869 b71 )
    ( on b590 b869 )
    ( on b724 b590 )
    ( on b39 b724 )
    ( on b850 b39 )
    ( on b144 b850 )
    ( on b911 b144 )
    ( on b40 b911 )
    ( on b299 b40 )
    ( on b45 b299 )
    ( on b341 b45 )
    ( on b650 b341 )
    ( on b204 b650 )
    ( on b915 b204 )
    ( on b432 b915 )
    ( on b534 b432 )
    ( on b799 b534 )
    ( on b48 b799 )
    ( on b460 b48 )
    ( on b235 b460 )
    ( on b457 b235 )
    ( on b212 b457 )
    ( on b449 b212 )
    ( on b30 b449 )
    ( on b439 b30 )
    ( on b972 b439 )
    ( on b323 b972 )
    ( on b207 b323 )
    ( on b99 b207 )
    ( on b370 b99 )
    ( on b609 b370 )
    ( on b5 b609 )
    ( on b52 b5 )
    ( on b559 b52 )
    ( on b637 b559 )
    ( on b550 b637 )
    ( on b671 b550 )
    ( on b501 b671 )
    ( on b350 b501 )
    ( on b856 b350 )
    ( on b881 b856 )
    ( on b605 b881 )
    ( on b487 b605 )
    ( on b92 b487 )
    ( on b314 b92 )
    ( on b596 b314 )
    ( on b121 b596 )
    ( on b931 b121 )
    ( on b817 b931 )
    ( clear b817 )
  )
  ( :goal
    ( and
      ( clear b71 )
    )
  )
)
