( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b282 - block
    b732 - block
    b311 - block
    b243 - block
    b150 - block
    b995 - block
    b668 - block
    b816 - block
    b637 - block
    b495 - block
    b363 - block
    b230 - block
    b79 - block
    b720 - block
    b536 - block
    b768 - block
    b996 - block
    b704 - block
    b659 - block
    b946 - block
    b359 - block
    b793 - block
    b193 - block
    b835 - block
    b560 - block
    b842 - block
    b751 - block
    b831 - block
    b590 - block
    b163 - block
    b876 - block
    b701 - block
    b117 - block
    b698 - block
    b640 - block
    b830 - block
    b453 - block
    b246 - block
    b746 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b282 )
    ( on b732 b282 )
    ( on b311 b732 )
    ( on b243 b311 )
    ( on b150 b243 )
    ( on b995 b150 )
    ( on b668 b995 )
    ( on b816 b668 )
    ( on b637 b816 )
    ( on b495 b637 )
    ( on b363 b495 )
    ( on b230 b363 )
    ( on b79 b230 )
    ( on b720 b79 )
    ( on b536 b720 )
    ( on b768 b536 )
    ( on b996 b768 )
    ( on b704 b996 )
    ( on b659 b704 )
    ( on b946 b659 )
    ( on b359 b946 )
    ( on b793 b359 )
    ( on b193 b793 )
    ( on b835 b193 )
    ( on b560 b835 )
    ( on b842 b560 )
    ( on b751 b842 )
    ( on b831 b751 )
    ( on b590 b831 )
    ( on b163 b590 )
    ( on b876 b163 )
    ( on b701 b876 )
    ( on b117 b701 )
    ( on b698 b117 )
    ( on b640 b698 )
    ( on b830 b640 )
    ( on b453 b830 )
    ( on b246 b453 )
    ( on b746 b246 )
    ( clear b746 )
  )
  ( :tasks
    ( Make-38Pile b732 b311 b243 b150 b995 b668 b816 b637 b495 b363 b230 b79 b720 b536 b768 b996 b704 b659 b946 b359 b793 b193 b835 b560 b842 b751 b831 b590 b163 b876 b701 b117 b698 b640 b830 b453 b246 b746 )
  )
)
