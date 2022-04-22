( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b787 - block
    b160 - block
    b788 - block
    b129 - block
    b293 - block
    b492 - block
    b759 - block
    b714 - block
    b654 - block
    b694 - block
    b320 - block
    b67 - block
    b8 - block
    b380 - block
    b239 - block
    b979 - block
    b797 - block
    b95 - block
    b268 - block
    b144 - block
    b130 - block
    b722 - block
    b930 - block
    b810 - block
    b27 - block
    b675 - block
    b523 - block
    b562 - block
    b506 - block
    b619 - block
    b741 - block
    b230 - block
    b191 - block
    b480 - block
    b691 - block
    b245 - block
    b940 - block
    b773 - block
    b188 - block
    b542 - block
    b557 - block
    b450 - block
    b688 - block
    b974 - block
    b733 - block
    b533 - block
    b779 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b787 )
    ( on b160 b787 )
    ( on b788 b160 )
    ( on b129 b788 )
    ( on b293 b129 )
    ( on b492 b293 )
    ( on b759 b492 )
    ( on b714 b759 )
    ( on b654 b714 )
    ( on b694 b654 )
    ( on b320 b694 )
    ( on b67 b320 )
    ( on b8 b67 )
    ( on b380 b8 )
    ( on b239 b380 )
    ( on b979 b239 )
    ( on b797 b979 )
    ( on b95 b797 )
    ( on b268 b95 )
    ( on b144 b268 )
    ( on b130 b144 )
    ( on b722 b130 )
    ( on b930 b722 )
    ( on b810 b930 )
    ( on b27 b810 )
    ( on b675 b27 )
    ( on b523 b675 )
    ( on b562 b523 )
    ( on b506 b562 )
    ( on b619 b506 )
    ( on b741 b619 )
    ( on b230 b741 )
    ( on b191 b230 )
    ( on b480 b191 )
    ( on b691 b480 )
    ( on b245 b691 )
    ( on b940 b245 )
    ( on b773 b940 )
    ( on b188 b773 )
    ( on b542 b188 )
    ( on b557 b542 )
    ( on b450 b557 )
    ( on b688 b450 )
    ( on b974 b688 )
    ( on b733 b974 )
    ( on b533 b733 )
    ( on b779 b533 )
    ( clear b779 )
  )
  ( :goal
    ( and
      ( clear b787 )
    )
  )
)
