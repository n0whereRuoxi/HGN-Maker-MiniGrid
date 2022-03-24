( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b886 - block
    b93 - block
    b776 - block
    b275 - block
    b474 - block
    b560 - block
    b798 - block
    b255 - block
    b724 - block
    b586 - block
    b277 - block
    b672 - block
    b851 - block
    b747 - block
    b953 - block
    b483 - block
    b849 - block
    b579 - block
    b587 - block
    b633 - block
    b298 - block
    b966 - block
    b318 - block
    b89 - block
    b669 - block
    b743 - block
    b375 - block
    b430 - block
    b978 - block
    b18 - block
    b952 - block
    b5 - block
    b454 - block
    b643 - block
    b513 - block
    b227 - block
    b174 - block
    b265 - block
    b520 - block
    b845 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b886 )
    ( on b93 b886 )
    ( on b776 b93 )
    ( on b275 b776 )
    ( on b474 b275 )
    ( on b560 b474 )
    ( on b798 b560 )
    ( on b255 b798 )
    ( on b724 b255 )
    ( on b586 b724 )
    ( on b277 b586 )
    ( on b672 b277 )
    ( on b851 b672 )
    ( on b747 b851 )
    ( on b953 b747 )
    ( on b483 b953 )
    ( on b849 b483 )
    ( on b579 b849 )
    ( on b587 b579 )
    ( on b633 b587 )
    ( on b298 b633 )
    ( on b966 b298 )
    ( on b318 b966 )
    ( on b89 b318 )
    ( on b669 b89 )
    ( on b743 b669 )
    ( on b375 b743 )
    ( on b430 b375 )
    ( on b978 b430 )
    ( on b18 b978 )
    ( on b952 b18 )
    ( on b5 b952 )
    ( on b454 b5 )
    ( on b643 b454 )
    ( on b513 b643 )
    ( on b227 b513 )
    ( on b174 b227 )
    ( on b265 b174 )
    ( on b520 b265 )
    ( on b845 b520 )
    ( clear b845 )
  )
  ( :goal
    ( and
      ( clear b886 )
    )
  )
)
