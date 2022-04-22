( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b195 - block
    b853 - block
    b641 - block
    b301 - block
    b370 - block
    b379 - block
    b68 - block
    b251 - block
    b695 - block
    b980 - block
    b833 - block
    b651 - block
    b240 - block
    b823 - block
    b394 - block
    b426 - block
    b239 - block
    b516 - block
    b739 - block
    b3 - block
    b31 - block
    b361 - block
    b339 - block
    b253 - block
    b994 - block
    b800 - block
    b164 - block
    b509 - block
    b955 - block
    b501 - block
    b433 - block
    b591 - block
    b829 - block
    b212 - block
    b831 - block
    b885 - block
    b535 - block
    b589 - block
    b655 - block
    b314 - block
    b432 - block
    b471 - block
    b639 - block
    b968 - block
    b662 - block
    b825 - block
    b203 - block
    b872 - block
    b936 - block
    b576 - block
    b277 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b195 )
    ( on b853 b195 )
    ( on b641 b853 )
    ( on b301 b641 )
    ( on b370 b301 )
    ( on b379 b370 )
    ( on b68 b379 )
    ( on b251 b68 )
    ( on b695 b251 )
    ( on b980 b695 )
    ( on b833 b980 )
    ( on b651 b833 )
    ( on b240 b651 )
    ( on b823 b240 )
    ( on b394 b823 )
    ( on b426 b394 )
    ( on b239 b426 )
    ( on b516 b239 )
    ( on b739 b516 )
    ( on b3 b739 )
    ( on b31 b3 )
    ( on b361 b31 )
    ( on b339 b361 )
    ( on b253 b339 )
    ( on b994 b253 )
    ( on b800 b994 )
    ( on b164 b800 )
    ( on b509 b164 )
    ( on b955 b509 )
    ( on b501 b955 )
    ( on b433 b501 )
    ( on b591 b433 )
    ( on b829 b591 )
    ( on b212 b829 )
    ( on b831 b212 )
    ( on b885 b831 )
    ( on b535 b885 )
    ( on b589 b535 )
    ( on b655 b589 )
    ( on b314 b655 )
    ( on b432 b314 )
    ( on b471 b432 )
    ( on b639 b471 )
    ( on b968 b639 )
    ( on b662 b968 )
    ( on b825 b662 )
    ( on b203 b825 )
    ( on b872 b203 )
    ( on b936 b872 )
    ( on b576 b936 )
    ( on b277 b576 )
    ( clear b277 )
  )
  ( :goal
    ( and
      ( clear b195 )
    )
  )
)
