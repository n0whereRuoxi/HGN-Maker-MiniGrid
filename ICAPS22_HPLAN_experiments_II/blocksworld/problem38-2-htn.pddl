( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b36 - block
    b138 - block
    b42 - block
    b652 - block
    b778 - block
    b570 - block
    b411 - block
    b741 - block
    b785 - block
    b325 - block
    b387 - block
    b826 - block
    b565 - block
    b419 - block
    b254 - block
    b218 - block
    b878 - block
    b525 - block
    b734 - block
    b824 - block
    b698 - block
    b386 - block
    b653 - block
    b93 - block
    b307 - block
    b441 - block
    b985 - block
    b629 - block
    b922 - block
    b687 - block
    b103 - block
    b212 - block
    b229 - block
    b301 - block
    b171 - block
    b880 - block
    b523 - block
    b560 - block
    b537 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b36 )
    ( on b138 b36 )
    ( on b42 b138 )
    ( on b652 b42 )
    ( on b778 b652 )
    ( on b570 b778 )
    ( on b411 b570 )
    ( on b741 b411 )
    ( on b785 b741 )
    ( on b325 b785 )
    ( on b387 b325 )
    ( on b826 b387 )
    ( on b565 b826 )
    ( on b419 b565 )
    ( on b254 b419 )
    ( on b218 b254 )
    ( on b878 b218 )
    ( on b525 b878 )
    ( on b734 b525 )
    ( on b824 b734 )
    ( on b698 b824 )
    ( on b386 b698 )
    ( on b653 b386 )
    ( on b93 b653 )
    ( on b307 b93 )
    ( on b441 b307 )
    ( on b985 b441 )
    ( on b629 b985 )
    ( on b922 b629 )
    ( on b687 b922 )
    ( on b103 b687 )
    ( on b212 b103 )
    ( on b229 b212 )
    ( on b301 b229 )
    ( on b171 b301 )
    ( on b880 b171 )
    ( on b523 b880 )
    ( on b560 b523 )
    ( on b537 b560 )
    ( clear b537 )
  )
  ( :tasks
    ( Make-38Pile b138 b42 b652 b778 b570 b411 b741 b785 b325 b387 b826 b565 b419 b254 b218 b878 b525 b734 b824 b698 b386 b653 b93 b307 b441 b985 b629 b922 b687 b103 b212 b229 b301 b171 b880 b523 b560 b537 )
  )
)
