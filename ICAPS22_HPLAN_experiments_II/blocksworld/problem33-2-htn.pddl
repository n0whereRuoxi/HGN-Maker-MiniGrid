( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b331 - block
    b206 - block
    b842 - block
    b814 - block
    b106 - block
    b834 - block
    b525 - block
    b409 - block
    b839 - block
    b184 - block
    b144 - block
    b101 - block
    b677 - block
    b164 - block
    b939 - block
    b636 - block
    b655 - block
    b275 - block
    b543 - block
    b623 - block
    b479 - block
    b649 - block
    b761 - block
    b78 - block
    b47 - block
    b435 - block
    b944 - block
    b658 - block
    b699 - block
    b73 - block
    b822 - block
    b672 - block
    b491 - block
    b537 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b331 )
    ( on b206 b331 )
    ( on b842 b206 )
    ( on b814 b842 )
    ( on b106 b814 )
    ( on b834 b106 )
    ( on b525 b834 )
    ( on b409 b525 )
    ( on b839 b409 )
    ( on b184 b839 )
    ( on b144 b184 )
    ( on b101 b144 )
    ( on b677 b101 )
    ( on b164 b677 )
    ( on b939 b164 )
    ( on b636 b939 )
    ( on b655 b636 )
    ( on b275 b655 )
    ( on b543 b275 )
    ( on b623 b543 )
    ( on b479 b623 )
    ( on b649 b479 )
    ( on b761 b649 )
    ( on b78 b761 )
    ( on b47 b78 )
    ( on b435 b47 )
    ( on b944 b435 )
    ( on b658 b944 )
    ( on b699 b658 )
    ( on b73 b699 )
    ( on b822 b73 )
    ( on b672 b822 )
    ( on b491 b672 )
    ( on b537 b491 )
    ( clear b537 )
  )
  ( :tasks
    ( Make-33Pile b206 b842 b814 b106 b834 b525 b409 b839 b184 b144 b101 b677 b164 b939 b636 b655 b275 b543 b623 b479 b649 b761 b78 b47 b435 b944 b658 b699 b73 b822 b672 b491 b537 )
  )
)
