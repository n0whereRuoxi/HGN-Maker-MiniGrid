( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b18 - block
    b208 - block
    b206 - block
    b976 - block
    b837 - block
    b882 - block
    b530 - block
    b731 - block
    b319 - block
    b473 - block
    b259 - block
    b101 - block
    b90 - block
    b668 - block
    b974 - block
    b576 - block
    b847 - block
    b230 - block
    b285 - block
    b173 - block
    b899 - block
    b653 - block
    b428 - block
    b152 - block
    b395 - block
    b507 - block
    b902 - block
    b757 - block
    b901 - block
    b403 - block
    b682 - block
    b717 - block
    b746 - block
    b377 - block
    b133 - block
    b117 - block
    b638 - block
    b891 - block
    b469 - block
    b839 - block
    b816 - block
    b998 - block
    b264 - block
    b416 - block
    b921 - block
    b774 - block
    b118 - block
    b84 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b18 )
    ( on b208 b18 )
    ( on b206 b208 )
    ( on b976 b206 )
    ( on b837 b976 )
    ( on b882 b837 )
    ( on b530 b882 )
    ( on b731 b530 )
    ( on b319 b731 )
    ( on b473 b319 )
    ( on b259 b473 )
    ( on b101 b259 )
    ( on b90 b101 )
    ( on b668 b90 )
    ( on b974 b668 )
    ( on b576 b974 )
    ( on b847 b576 )
    ( on b230 b847 )
    ( on b285 b230 )
    ( on b173 b285 )
    ( on b899 b173 )
    ( on b653 b899 )
    ( on b428 b653 )
    ( on b152 b428 )
    ( on b395 b152 )
    ( on b507 b395 )
    ( on b902 b507 )
    ( on b757 b902 )
    ( on b901 b757 )
    ( on b403 b901 )
    ( on b682 b403 )
    ( on b717 b682 )
    ( on b746 b717 )
    ( on b377 b746 )
    ( on b133 b377 )
    ( on b117 b133 )
    ( on b638 b117 )
    ( on b891 b638 )
    ( on b469 b891 )
    ( on b839 b469 )
    ( on b816 b839 )
    ( on b998 b816 )
    ( on b264 b998 )
    ( on b416 b264 )
    ( on b921 b416 )
    ( on b774 b921 )
    ( on b118 b774 )
    ( on b84 b118 )
    ( clear b84 )
  )
  ( :goal
    ( and
      ( clear b18 )
    )
  )
)
