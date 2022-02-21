( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b126 - block
    b830 - block
    b42 - block
    b192 - block
    b419 - block
    b211 - block
    b16 - block
    b251 - block
    b69 - block
    b106 - block
    b473 - block
    b526 - block
    b183 - block
    b988 - block
    b302 - block
    b43 - block
    b994 - block
    b684 - block
    b889 - block
    b942 - block
    b182 - block
    b33 - block
    b776 - block
    b947 - block
    b60 - block
    b256 - block
    b147 - block
    b766 - block
    b456 - block
    b886 - block
    b927 - block
    b148 - block
    b230 - block
    b710 - block
    b179 - block
    b972 - block
    b949 - block
    b944 - block
    b72 - block
    b613 - block
    b687 - block
    b54 - block
    b59 - block
    b718 - block
    b80 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b126 )
    ( on b830 b126 )
    ( on b42 b830 )
    ( on b192 b42 )
    ( on b419 b192 )
    ( on b211 b419 )
    ( on b16 b211 )
    ( on b251 b16 )
    ( on b69 b251 )
    ( on b106 b69 )
    ( on b473 b106 )
    ( on b526 b473 )
    ( on b183 b526 )
    ( on b988 b183 )
    ( on b302 b988 )
    ( on b43 b302 )
    ( on b994 b43 )
    ( on b684 b994 )
    ( on b889 b684 )
    ( on b942 b889 )
    ( on b182 b942 )
    ( on b33 b182 )
    ( on b776 b33 )
    ( on b947 b776 )
    ( on b60 b947 )
    ( on b256 b60 )
    ( on b147 b256 )
    ( on b766 b147 )
    ( on b456 b766 )
    ( on b886 b456 )
    ( on b927 b886 )
    ( on b148 b927 )
    ( on b230 b148 )
    ( on b710 b230 )
    ( on b179 b710 )
    ( on b972 b179 )
    ( on b949 b972 )
    ( on b944 b949 )
    ( on b72 b944 )
    ( on b613 b72 )
    ( on b687 b613 )
    ( on b54 b687 )
    ( on b59 b54 )
    ( on b718 b59 )
    ( on b80 b718 )
    ( clear b80 )
  )
  ( :goal
    ( and
      ( clear b126 )
    )
  )
)
