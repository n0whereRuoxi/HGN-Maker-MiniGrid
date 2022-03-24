( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b607 - block
    b309 - block
    b835 - block
    b151 - block
    b646 - block
    b593 - block
    b977 - block
    b371 - block
    b29 - block
    b932 - block
    b328 - block
    b612 - block
    b924 - block
    b491 - block
    b535 - block
    b778 - block
    b494 - block
    b682 - block
    b180 - block
    b823 - block
    b697 - block
    b395 - block
    b776 - block
    b43 - block
    b878 - block
    b175 - block
    b845 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b607 )
    ( on b309 b607 )
    ( on b835 b309 )
    ( on b151 b835 )
    ( on b646 b151 )
    ( on b593 b646 )
    ( on b977 b593 )
    ( on b371 b977 )
    ( on b29 b371 )
    ( on b932 b29 )
    ( on b328 b932 )
    ( on b612 b328 )
    ( on b924 b612 )
    ( on b491 b924 )
    ( on b535 b491 )
    ( on b778 b535 )
    ( on b494 b778 )
    ( on b682 b494 )
    ( on b180 b682 )
    ( on b823 b180 )
    ( on b697 b823 )
    ( on b395 b697 )
    ( on b776 b395 )
    ( on b43 b776 )
    ( on b878 b43 )
    ( on b175 b878 )
    ( on b845 b175 )
    ( clear b845 )
  )
  ( :goal
    ( and
      ( clear b607 )
    )
  )
)
