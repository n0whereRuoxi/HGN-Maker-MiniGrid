( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b203 - block
    b825 - block
    b266 - block
    b839 - block
    b68 - block
    b528 - block
    b967 - block
    b537 - block
    b997 - block
    b465 - block
    b315 - block
    b738 - block
    b681 - block
    b565 - block
    b535 - block
    b654 - block
    b668 - block
    b748 - block
    b803 - block
    b7 - block
    b764 - block
    b172 - block
    b448 - block
    b759 - block
    b911 - block
    b777 - block
    b718 - block
    b971 - block
    b956 - block
    b925 - block
    b806 - block
    b544 - block
    b41 - block
    b661 - block
    b361 - block
    b602 - block
    b564 - block
    b154 - block
    b581 - block
    b62 - block
    b826 - block
    b694 - block
    b853 - block
    b859 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b203 )
    ( on b825 b203 )
    ( on b266 b825 )
    ( on b839 b266 )
    ( on b68 b839 )
    ( on b528 b68 )
    ( on b967 b528 )
    ( on b537 b967 )
    ( on b997 b537 )
    ( on b465 b997 )
    ( on b315 b465 )
    ( on b738 b315 )
    ( on b681 b738 )
    ( on b565 b681 )
    ( on b535 b565 )
    ( on b654 b535 )
    ( on b668 b654 )
    ( on b748 b668 )
    ( on b803 b748 )
    ( on b7 b803 )
    ( on b764 b7 )
    ( on b172 b764 )
    ( on b448 b172 )
    ( on b759 b448 )
    ( on b911 b759 )
    ( on b777 b911 )
    ( on b718 b777 )
    ( on b971 b718 )
    ( on b956 b971 )
    ( on b925 b956 )
    ( on b806 b925 )
    ( on b544 b806 )
    ( on b41 b544 )
    ( on b661 b41 )
    ( on b361 b661 )
    ( on b602 b361 )
    ( on b564 b602 )
    ( on b154 b564 )
    ( on b581 b154 )
    ( on b62 b581 )
    ( on b826 b62 )
    ( on b694 b826 )
    ( on b853 b694 )
    ( on b859 b853 )
    ( clear b859 )
  )
  ( :goal
    ( and
      ( clear b203 )
    )
  )
)
