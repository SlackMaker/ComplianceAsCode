# ComplianceAsCode
O ComplianceAsCode visa melhorar o processo de desenvolvimento de software por meio da demonstração automática de que o novo código está em conformidade com as políticas e regulamentações relevantes. Para fazer compliance como código, o objetivo é definir suas políticas de compliance de forma que possam ser escritas como testes.

# Ambiente de teste realizado com RedHat7
- Primeiro instale o Red Hat versão 7;
- Instale o Docker - https://docs.docker.com/engine/install/rhel/
- Instale o Terraform - https://developer.hashicorp.com/terraform/cli/install/yum  

# Guia rápido
Clonar o repositório abaixo:
```
# git fork https://github.com/SlackMaker/ComplianceAsCode.git
# cd terraform-openscap
```
Execute diretamente os comandos a seguir (Terraform), onde a idéia é ele conversar com o Dockerfile e criar o conteiner chamado openscap:
```
`# terraform init` - Inicializa o ambiente com o provider utilizado, em nosso caso `docker`,
`poderia ser o `aws` onde seria iniciado com o plugin para Amazon Web Services.` 
`# terraform plan` - Mostra o plano de execução do terraform.
`# terraform apply` - Este comando cria e altera as Instâncias/Objetos no Provider de acordo com o seu terraform
```

Após de ser criada a imagem, com o último comando mencionado acima, entre na mesma com o comando abaixo:
```
`# docker run -it openscap:latest /bin/bash`
`# oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_stig --report /tmp/report.html /usr/share/xml/scap/ssg/content/ssg-rhel7-ds.xml` 
```
Feito isso, o nosso estimado amigo openscap irá começar escanear sua máquina, gerando um relatorio magnífico no diretório /tmp