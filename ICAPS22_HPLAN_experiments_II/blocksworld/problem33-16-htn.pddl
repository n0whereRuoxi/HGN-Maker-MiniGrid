( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b640 - block
    b67 - block
    b620 - block
    b157 - block
    b897 - block
    b519 - block
    b876 - block
    b81 - block
    b126 - block
    b108 - block
    b118 - block
    b366 - block
    b292 - block
    b545 - block
    b443 - block
    b961 - block
    b160 - block
    b480 - block
    b72 - block
    b288 - block
    b313 - block
    b714 - block
    b944 - block
    b387 - block
    b758 - block
    b127 - block
    b433 - block
    b618 - block
    b229 - block
    b10 - block
    b931 - block
    b997 - block
    b958 - block
    b347 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b640 )
    ( on b67 b640 )
    ( on b620 b67 )
    ( on b157 b620 )
    ( on b897 b157 )
    ( on b519 b897 )
    ( on b876 b519 )
    ( on b81 b876 )
    ( on b126 b81 )
    ( on b108 b126 )
    ( on b118 b108 )
    ( on b366 b118 )
    ( on b292 b366 )
    ( on b545 b292 )
    ( on b443 b545 )
    ( on b961 b443 )
    ( on b160 b961 )
    ( on b480 b160 )
    ( on b72 b480 )
    ( on b288 b72 )
    ( on b313 b288 )
    ( on b714 b313 )
    ( on b944 b714 )
    ( on b387 b944 )
    ( on b758 b387 )
    ( on b127 b758 )
    ( on b433 b127 )
    ( on b618 b433 )
    ( on b229 b618 )
    ( on b10 b229 )
    ( on b931 b10 )
    ( on b997 b931 )
    ( on b958 b997 )
    ( on b347 b958 )
    ( clear b347 )
  )
  ( :tasks
    ( Make-33Pile b67 b620 b157 b897 b519 b876 b81 b126 b108 b118 b366 b292 b545 b443 b961 b160 b480 b72 b288 b313 b714 b944 b387 b758 b127 b433 b618 b229 b10 b931 b997 b958 b347 )
  )
)
